# Gamma => &gamma
    Norm is ~2.2
## gamma correction
    color_output = color_input to the power of 1/gamma(~2.2)

# Alpha Blending
## img1 over img2 
* using a stack based model :
    2 img at a time, computed recursively, with Straight alpha model
---
    RGBA space
    c for color, a for alpha
- 1 alpha value
    img1 => c_f, a_f
    img2 => c_b
    final_color = a_f * c_f + (1 - a_f) * c_b

So anything between 0 and 1 become - linear interpolation - between img1 and img2

- Multiple alpha values
    img1 => c_f, a_f (foreground)
    img2 => c_b, a_b (background)

    * compute alpha first (alpha of f and alpha of b)
    Alphas = a_f + (1 - a_f) * a_b
    final_color = ( a_f * c_f + (1 - a_f) * a_b * c_b ) / Alphas

    disclaimer =>
        to avoid division by zero
        add a conditionnal, returning the color of img1 or 2,
        if opacity is null, it means that resulting color is the other img anyway

# Alpha types

* Premultipled alpha
        (aR, aG, aB, a)
* Straight alpha
    Most images are stored in this format
    Operations are decently cheap for todays computers
    Implicit recomputation each time imgs are displayed
        (R,G,B,a)
* Displayed alpha
    or multiplied, is what is seen
    (aR, aG, aB)

# Blending modes

Those are examples, a blending mode is basically any f()
that combines pixels of 2 images.
The function name resulting in its tranformation:
    From photoshop: Divide, Hue, Saturation, Color, Luminosity,
    Color Burn, Linear Burn, Lighten, Darken, etc...

The official standard way of blending 2 images is the
alpha blending(see above) or Normal blend(in photoshop).

- Additive Blending
    final_color = c_f + c_b + c_c + ....
    multiple alphas require extra processing
    Alphas = clamp(a_f + a_b)
    see clamping..
    final_color = (a_f * c_f + a_b * c_b) / Alphas

- Difference Blending
    more for algorithmic purpose and comparison
    c = | a_f*c_f - c_b |

- Multiply Blending
    Hint increasing value result in darker blend
    c = c_f * c_b
    c = a_f(c_f * c_b) + (1 - a_f)* c_b
- Screen Blending
    opposite off multiplied blending, result in lighter blend
    c = 1 - (1 - c_f) (1 - c_b )

## Clamping
    used to restrict a value to a given range,
    or limiting a position to an area.
    Ex: OpenGl glClearColor values are `clamped` to [0,1]

## Normalizing
    used to map value into a given range,

    Difference with Clamping
    From unreal engine forums :
```
    .. clamp will cut off all values lower than min and higher than max.
    Normalize will takes a range and normalizes the incoming number according to the range.
```
    So clamp, truncate to [min,max] and
    normalize scale it to [min,max]

## Wrapping
LATER

# Transformation
## 2D
### Affine transformations
Those are the simplest forms, and are linear
in the sense that they preserve perpendicular and parallel property
* Translation
    vectors
        p1 = p + t
```
        [ p1_x , p1_y ] = [ p_x + t_x,
                            p_y + t_y
                          ]
```
* Scale
    - uniform scale
    p1 = s*p
```
        [ p1_x , p1_y ] = [ s*p_x,
                            s*p_y
                          ]
```
    - non-uniform scale
    same but values are distributed
```
        [ p1_x , p1_y ] = [ s_x * p_x,
                            s_y * p_y
                          ]
```
    those are diagonal matrices
    meaning non-zero value are in the middle
    S = [
          S_x 0
          0  S_y
        ]


* Rotation
    according to identity rectangle triangle(hypothenuse = 1)
    and "sohcahtoa" rules.

    p1 = R p
```
    [ p1_x, p1_y ] = P_x[ cos(theta), sin(theta) ] + P_y[ -sin(theta), cos(theta) ]
    matrix form
    [       [                          [
    p1_x, =  cos(theta), -sin(theta)    Px,
    p1_y     sin(theta), cos(theta)     Py
    ]       ]                          ]

```
    Rotation matrice R are orthogonal,
    Property of orthogonal matrice : it's transpose is it's inverse
    R = [
         cos(theta), -sin(theta)
         sin(theta), cos(theta)
         ]
    clockwise
    R R_t = R_t R = I = [
                            1 0
                            0 1
                        ]


> `Skew is not a tranformation, its a combination:
  and a good example of defining a transformation matrix
=> rotation, un-uniform scaling, and then rotation(usually inverse back)

so

    p1 = R2 S R1 p = Mp
    where R2 S R1 can be combined in 1 matrice

THE RULE
> Any 2x2 Matrix can be derived to a Rotation,a Scale and a Rotation, and its not specific
> to the skew

## The SVD principle
SVD stand for singular value decomposition

M = U S V_T
where U => orthogonal()
      S => diagonal(scale)
      V_T => orthogonal()
* Any series of Rotation and Scale can be converted to a transformation matrix
p1 = RSRSRSRSRSRSR p
p1 = M p

# Homogeneous Coordinates
Encapsulate anything we want to do in 1 matrix, position and direction.
It's a trick to pack up operation containing translation and other transformation(in 2d)
where you add a virtual coodinate, or extra dimension, to the matrix.

```
[ p1_x, p1_y ] = [ px + t, py + t ]
<=> becomes
[ p1_x, p1_y, 1 ] = [           [
                     1 0 t_x     p_x
                     0 1 t_y     p_y
                     0 0 1       1
                    ]

```
Why?

* Any series of Rotation Scale, and/or Translation can be converted to a transformation matrix
p1 = TSRTSRSRSRT p
M = TSRTSRSRSRT
p1 = M p

```
[ p1_x, p1_y, 1 ] = [           [
                     a c e      p_x
                     b d f      p_y
                     0 0 1       1
                    ]
```

* With Position vs Direction vectors
Replace the factor of 1 by 0

```
[ p1_x, p1_y, 1 ] = [           [
                     a c e      p_x
                     b d f      p_y
                     0 0 1       1
                    ]

[ p1_x, p1_y, 0 ] = [           [
                     a c e      p_x
                     b d f      p_y
                     0 0 1       0
                    ]
```
