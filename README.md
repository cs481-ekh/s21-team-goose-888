
# Mobile App for Labratory Data Results
![Dart](https://github.com/cs481-ekh/s21-team-goose-888/workflows/Dart/badge.svg)
## Members:
 - Zachary Garner
 - Edward Kourbanov
 - John Martin
 
## Abstract:
Our project is a mobile application that streamlines the process the Idaho Transportation Department uses for analyzing and recording soil and pavement sample data. The application's user interface replicates the form this is normally manually completed on, the ITD-888 form. The information stored is then saved to a database directly instead of having to be transcribed to an online QASP portal which is then saved and stored to a database.

Many of the form sections require data results that come directly from laboratory equipment. These various pieces of equipment have a digital readout which can be photographed to help record the data. Our application uses an optical character recognition (OCR) API in order to take these images and directly convert them to text to be saved into the form, in turn saving it directly to the database. This streamlines the entire processes for lab technicians as they are able to easily take pictures and convert data without worrying about the tedious process of transcribing this information.

At any point in time, the user can save the information in the current section which will be directly stored in the database. They can move onto any section of a form afterwards. Furthermore, they can select any form in the database they may have access to as well. This simplifies record keeping as everything is available from one source.

## Project Description:
Using firebase as the backbone for our backend, we created a NoSQL database to store the collection of Users and unique ITD forms. We designed each form document after the ITD-888 form. Each document conains a field for the different form sections from LooseMixR97 to T30. Each of these sections contains a map where we pair the name of the form field to the value that is saved to that form field. The name of the field is the key and the value contained in the formfield is the value to the key (in terms of key-value mapping).

For the user-interface we needed to have a login and registration page for users to be able to use the application. We developed the login and registration pages below.

Upon login, users need to be able to create new ITD-888 forms to fill out or select existing ones that need to be completed. This data is all dynamically being pulled from the firebase backend. We implemented the user interface for these sections as shown below.

Once a project is created or selected, a user has access to the different form sections. We split each form section into a button that would take you to the page that allows you to fill out the selected form:

Of course, every form section looks different depending on the original ITD-888 form section that we used as a template. One thing that is common amongst almost all the forms are the sections that allow the user to be able to select a picture they have taken in order to use the OCR feature we implemented. Once a user selects an image, it is displayed on the page and the OCR API attempts to decipher what is in the image. The value is then displayed in the form field where the user can modify the value in case it is inaccurate.

Once a user is done with a particular form section, they can save the changes using the button at the bottom of the screen and proceed to any other form section or form they need to work on.
