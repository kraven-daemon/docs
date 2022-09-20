### Android with kotlin

Terminology
* [Views](#views)
* [Fragments](#fragments)
* [Navigation](#navigation)
* [Activity](#activity)
* [Life cycle](#life_cycle)
* [File Structure](#file_structure)
* 

    - Navigate UP = refer to the arrow in the app at the top of the systemUI
    - Navigate BACK = refer to the bottom arrow/triangle/widget that is used
        by the system, can go beyond the app(home/launcher)
    - NavHostFragment
        - Hosted Fragment

    view.find
    Pop behavior = when you press preview_button ( system nagivation triangle we all know <| )

* Action
	- Intents : activity to activity through Action
    	- Explicit : Based on class name.
    	- Implicit : From system, usually, since they are given as 
        	- subcategories
            	- Data type (MIME)
* PackageManager 
	- knows about all the activities that are 	registred across package manifest across all device

### FILES
AndroidManifest.xml
    - Google play data
    - Intents filters

Android only opens => MainActivity
Stacking from (usually) first stack => launcher app, that launch Activity



<h3 id="views"> Views </h3>
<h3 id="fragments"> Fragments </h3>
<h3 id="navigation"> Navigation </h3>
<h3 id="activity"> Activity </h3>
<h3 id="life_cycle"> Life cycle </h3>

Approach to life cycle management ressources
- Proactive
	> Clean unused ressources as you go (this is not X86_64 arch) so activities keep running smoothly 
	
- Defensive
	> In case the OS decide to kill, suspend or restart the app (yes, remember it's a phone).
	
Application class
	- Base class containing the global application state of the entire app
	- Also the main object construction that android use to interact with the app

<h3 id="file_structure"> File Structure </h3>
