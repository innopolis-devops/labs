# Best practices used
- #### Proper naming of variables and functions ✨
    Long variable names and functions were written in the lower case and using underscores (_). No single letter variables were used
- #### PyPI modules and libraries were used ✨
    Existing models (such as datetime) were used to make the code more compact and modular
- #### Comments in the code ✨
    Comments in the code were used to describe the role of specific part
- #### Documentation ✨
    The documentation about the app including its objectives and installing guidelines is prepared

# Framework used

To develop this app a [Flask] framework was chosen.Because it is a micro framework which prvodes a fast use, yet can be scaled for more complex projects.

## Pros
- #### Relative simplicity
    This framework is good and simple for beginners to start with, which provides opportunities to learn
- #### Testing oportunities
    Using Flask provides opportunities for doing unit tests through built-in development server and quick debugger

## Cons

- #### Security risk
    Due to the presence of outer modules the security is at risk when malicious module is involved
- #### Limited tools
    Flask has fewer tools, and thus sometimes will be needed to search for extensions or libraries in the community

# Linters used ✨

### Flake8 was used to check the code for the lints
Used to find both logical and stylistic lint. It combines following linters:
-  #### PyFlakes
    checkes for errors
-  #### pycodestyle
    checks for style conventions in PEP 8
-  #### Mccabe
    Checks Mccabe complexity



 [Flask]: <https://github.com/joemccann/dillinger>
 [WorldTimeApi]: <http://worldtimeapi.org/>