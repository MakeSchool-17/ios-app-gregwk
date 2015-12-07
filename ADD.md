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

Box SDK
CommonStandards API (http://beta.commonstandardsproject.com/developers)
Gloss
AlamoFire
Realm
Parse

Research-- do I need to use the API, or can I just pull the data base from other open source apps?



####Screens



####Views / View Controllers/ Classes


####Data Models

Teacher
    properties:
        classroom -- Classroom object


Classroom
    properties:
        studentRoster -- array of student objects
        subject -- string
        standards -- array of standards
        assignments -- array of Assignment objects


Student
    properties:
        firstName -- String
        lastName -- String
        assignments -- Assignment Object
        portfolio -- Portfolio Object

Assignment
    properties:
        standard -- string
        studentWork -- file







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

--Next Milestones--

    create custom buttons/views for assignment creation UI
    finish mapping out assignment creation workflow
    create newAssignmentViewController
    create newClassViewController


    --debugging--
        warning label for LoginViewController doesn't appear on empty inputs





    Begin working on table views
    design CreateNewAssignmentViewController
    Learn how to use CommonStandards API to populate CreateNewAssignmentViewController with standards data (write down specific questions for instructors)
    Finish data model (talk to instructors about this)


## Copyright notes

list of all copyrighted material used in app

current book icon on LoginViewController:

Book graphic by <a href="http://www.freepik.com/">Freepik</a> from <a href="http://www.flaticon.com/">Flaticon</a> is licensed under <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0">CC BY 3.0</a>. Made with <a href="http://logomakr.com" title="Logo Maker">Logo Maker</a>

Pictures used in buttons:

http://www.morguefile.com/archive/display/3386 -- single pencil
http://www.morguefile.com/archive/display/25519 -- multiple pencils
