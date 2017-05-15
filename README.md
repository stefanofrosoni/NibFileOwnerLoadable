# NibFileOwnerLoadable
NibFileOwnerLoadable Protocol in Swift

* A UIView subclass can conform to this protocol when is used as the XIB's File's Owner.
* The nib has the same name as the name of the class and is located in the bundle of that class
* To use:  
    * Make your custum UIView conforming to the NibFileOwnerLoadable protocol. 
    * Call "self.loadNibContent()" to setup and add the first view in the XIB as subview with constraints.
    * If you need only to instatiate the view from the nib just use "self.instantiateFromNib()"; this return an optional view. 
