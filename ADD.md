#App Design Document

Actionable -


##Objective

Create a mobile application that allows teachers to categorize assignments according to common core standards, allowing easy creation of a student portfolio of work.

##Audience

When a student fails to show appropriate Annual Yearly Progress (AYP) on standardized tests, the school may submit a portfolio of the student's work showing examples of student performance that meets all appropriate standards.  This app is meant to help teachers and administrators easily track and categorize student work by linking the work to appropriate standards.  This will allow teachers and administrators to select the most effective examples of student work while also cutting down the overall time it takes to organize the student portfolio.

##Experience

Upon sign in, users will be presented with a table view of their current classes (the "Dashboard").  If they have no current classes, they will be prompted to create a new class and add students to it.  When creating a class, teachers will choose the appropriate subject and grade level standards to attach to the class, along with any other relevant information.  

Once class setup is complete, teachers create profiles for each student, or import the class list as a comma-delimited spreadsheet.  Teachers will then be prompted to any necessary qualifiers to each student profile (for instance, label a student as an ELL or attach an appropriate IEP).  

Once all student profiles are created, users will then be returned to the dashboard.  From here, users may view a class, create a new class (repeating the previous process), or create an assignment.  

The "Create Assignment" screen will allow users to create an assignment.  On this screen, users will be prompted to upload the assignment (by file, or by taking a picture with the iPad camera).  Users will then link this file to the appropriate standards for that grade level.  The Following screen will then allow the user to choose what class(es) receive the assignment.  Users may also link assignments to students on an individual basis.  Once assigned, users will be returned to the Dashboard.  

From the dashboard, if a user clicks on a a class cell, they will open a view showing all the students in the class.  If a user clicks on a student, this will show the current state of their portfolio by standard ("Student Portfolio Overview screen").  Standards that have been met (student work attached) will be tinted green.  Standards that have not yet had student work attached will be plain white cells.  Clicking on a standard will bring up view that shows the assignment along with the student work.  At the bottom of the Student Portfolio Overview scroll view, there is a button to generate the student portfolio.  If the student portfolio is not yet complete, this button will be greyed-out, and a small text label will inform the user that they cannot generate an incomplete portfolio.




##Technical

####External Services

CommonStandards API: (http://beta.commonstandardsproject.com/developers)
AlamoFire
Parse

####Screens



####Views / View Controllers/ Classes


####Data Models

Student
    properties:
        firstName -- String
        lastName -- String
        studentNumber -- String
        assignments -- Array of Assignments
        classes -- Array of Strings
        portfolio -- Portfolio Object

Assignment
    properties:
        assignmentName -- String
        standard -- String
        studentWork -- Array of UIImages
        submitted -- Bool
        passing -- Bool
        dateAssigned -- String (result of NSDateFormatter)
        

##MVP Milestones

--Completed Milestones--

    product research
    overall UX design
    build basic UI
    set up cocoapods
    implement Parse sign up in SignUpViewController
    implemented login using Parse
    finished LoginViewController
    finished basic layout for ForgotPasswordViewController
    debugging: Segue from loginVC to forgotPasswordVC now works correctly
    designed data models
    created data models in Parse
    Finished SignUpViewController
    Created rough map of assignment creation workflow
    Finished full map of assignments Tab Workflow
    Created rough map of Classes tab workflow
    Assigned ViewControllers to all new Views on the storyboard
    Added working back buttons to ALL nav bars
    Finished General UI Layout/Workflow for all tabs except Portfolio View.
    Added validation checks to textfields on CreateStudentsForClass VC.  They even fade out!
    Basic classrooms can now be created on the classrooms track
    students can be added to class roster during class creation
    Table view added to show students enrolled in newly created class
    App now successfully grabs standards for given jurisdiction from CommonStandards API


--Next Milestones--
    --Finish "Remaining Steps" and polish the app before 3pm!

    
    --debugging--
        Scroll View doesnt adjust from open keyboard on LoginViewController
        


## Remaining Steps

    -- finish all debugging tasks
    -- Create 10 more dummy standards
    -- Persist Photo Storage for Student Assignment Detail View
    -- Add Icons to Tab Bar View Controller

    ##--Completed--
    
    -- ~~Get classroom cells to segue to detail view on tap~~
    -- ~~Get assignment cells to segue to detail view on tap~~
    -- ~~Implement a student detail view for classroom~~
    -- ~~Add functionality that allows teachers to select students for assignments~~
    -- ~~Add Screen that allows user to change settings~~
    -- ~~Add screen that asks teacher to select jurisdiction for standards during sign up process~~ 
    -- ~~Implement camera view for assignment creation track~~
    -- ~~Move standards API call from app delegate to assignment creation track~~
    -- ~~Implement single sign-in features from Parse~~
    -- ~~Implement swipe to delete assignment from student for Assignment Info View Controller~~
    -- Load students from Parse for Assignment Info View Controller
    
## Copyright notes

list of all copyrighted material used in app

current book icon on LoginViewController:

Book graphic by <a href="http://www.freepik.com/">Freepik</a> from <a href="http://www.flaticon.com/">Flaticon</a> is licensed under <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0">CC BY 3.0</a>. Made with <a href="http://logomakr.com" title="Logo Maker">Logo Maker</a>

Pictures used in buttons:

http://www.morguefile.com/archive/display/3386 -- single pencil
http://www.morguefile.com/archive/display/25519 -- multiple pencils

JSON files of Common Core State Standards borrowed from Common Standards Github Page.  

Fade in/Fade Out extensions learned from tutorial by Andrew Bancroft(https://www.andrewcbancroft.com/2014/07/27/fade-in-out-animations-as-class-extensions-with-swift/)

Really sweet delay function by "@matt" found on SO (http://stackoverflow.com/questions/24034544/dispatch-after-gcd-in-swift/24318861#24318861)

Calendar Date Picker for selecting assignment date during assignment creation/editing -- https://github.com/hons82/THCalendarDatePicker

Code for PhotoTakingHelper.Swift borrowed with permission from Josh Archer, and from Make School Makestagram tutorial.

Sweet app icon for Portfolio Tracker created by Tyler Hoffman (my friend, and the second best developer to ever come out of South Africa.)





