# OR-Tools .Net Alpine Integration

Using .Net OR-Tools in a microsoft alpine docker

## Docker Test

To build, simply run:
```sh
docker build -t alp --target=build -f Dockerfile .
```

To run:
```sh
docker run --rm -it alp dotnet bin/Debug/netcoreapp3.1/Google.OrTools.SimpleRoutingProgram.dll
```

Observed:
```sh
Unhandled exception. System.TypeInitializationException: The type initializer for 'Google.OrTools.ConstraintSolver.operations_research_constraint_solverPINVOKE' threw an exception.
 ---> System.TypeInitializationException: The type initializer for 'SWIGExceptionHelper' threw an exception.
 ---> System.DllNotFoundException: Unable to load shared library 'google-ortools-native' or one of its dependencies. In order to help diagnose loading problems, consider setting the LD_DEBUG environment variable: Error loading shared library libgoogle-ortools-native: No such file or directory
   at Google.OrTools.ConstraintSolver.operations_research_constraint_solverPINVOKE.SWIGExceptionHelper.SWIGRegisterExceptionCallbacks_operations_research_constraint_solver(ExceptionDelegate applicationDelegate, ExceptionDelegate arithmeticDelegate, ExceptionDelegate divideByZeroDelegate, ExceptionDelegate indexOutOfRangeDelegate, ExceptionDelegate invalidCastDelegate, ExceptionDelegate invalidOperationDelegate, ExceptionDelegate ioDelegate, ExceptionDelegate nullReferenceDelegate, ExceptionDelegate outOfMemoryDelegate, ExceptionDelegate overflowDelegate, ExceptionDelegate systemExceptionDelegate)
   at Google.OrTools.ConstraintSolver.operations_research_constraint_solverPINVOKE.SWIGExceptionHelper..cctor()
   --- End of inner exception stack trace ---
   at Google.OrTools.ConstraintSolver.operations_research_constraint_solverPINVOKE.SWIGExceptionHelper..ctor()
   at Google.OrTools.ConstraintSolver.operations_research_constraint_solverPINVOKE..cctor()
   --- End of inner exception stack trace ---
   at Google.OrTools.ConstraintSolver.operations_research_constraint_solverPINVOKE.new_RoutingIndexManager__SWIG_0(Int32 jarg1, Int32 jarg2, Int32 jarg3)
   at SimpleRoutingProgram.Main(String[] args) in /usr/local/google/home/corentinl/work/dotnet_alpine_or-tools/SimpleRoutingProgram.cs:line 36
```

## License

Apache 2. See the LICENSE file for details.

## Disclaimer

This is not an official Google product, it is just code that happens to be
owned by Google.
