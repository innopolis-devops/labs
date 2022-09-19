# Dart best practices for web app dev

This language was choosed since I have some expiriance in developing applications with it.

## Framework

There is one popular framework for dart to develop applicatoins and it is Flutter. This is one of the most popular cross-platform frameworks in Russia (and probably in the World) and it is a good choise when you need to develop small or medium scale multiplatform app that does not use fancy platform spesific thinks. So it is not the best but a good choise for wimple web app

## Practices

### 1. Pacages

For dart/flutter there are a lot of different packages so one of the most important practices is to use them. All the packages are open sourse and there is no need to implement something that was allready implemented (unless you cannot find anything satisfactory for your needs).

### 2. State Managment

Dispite futter have some good aprouches to state managment with its "Stateful Widget". Nevertheless, it is still a good practice to use some packages to handlle tihs in order to reduce boilerplate. What is more thous packages usualy are base for archetechture of the project. The most popualar libs are:

- Bloc/Cubit (hard but it definece whole app structure)
- Provede (google approuch to state managment until Provider was created)
- Provider (simple package used by google and advertised a lot)
- Riverpod (Another approuch to Provide philosofy + flutter approuch in using React Hooks)

In this project riverpod was used since I work quite alot with it lately

### 3. Dependency Ingection (DI)

Same story with DI there is "Inherited Widget" but libs makes development mach easier and faster. Examples are:

- GetIt
- Simple Dependency Injection
- Riverpod
- Provider

For DI riverpod was used as well.

### 4. Routing

TLDR use packages as well. There are:

- GoRouter
- Auto Route
- (Did not go into this topic to mach since I found GoRouter too fast and like it a lot)

In this project GoRouter was used.

### 5. Lint

Flutter project has already build in lint and it should be turned on (and it is)

### 6. File Formatting

I use vscode extention that does formatting for me

### 7. Test

do a widget tests with provided functionality and check the time in a range

## Conclusion

Use packege for everything in flutter. The main packages for this app are Riverpod and GoRouter
