#SAMPLE FATJAR PROJECT
This is a sample Java project to illustrate building jars for inclusion in the JDA runtime. 
 

##Summary
The key point is that jars deployed should have all their dependencies included but 
should NOT include dependencies that clash with the libraries deployed by JDA.  

For example, if a class implements a moca interface or requires access to JDA moca classes, 
these should not be deployed back to the server. In the example gradle build script 
the moca jar dependency is declared as a compile only dependency.  

Running the build task 'fatjar' will compile the source and include classes from all 
the 'compile' dependencies but not the 'compileOnly' dependencies.  

A list of the deployed jars from the JDA mocaserver runtime is included (2018jdajars.txt) 
bases on a 2018 JDA installation.  

If your project depends on any of the jars in this list then the versions should match 
these versions. Occasionally there are multiple versions of the same library already 
in this list, care should be taken in this instance to check for compatibility but using 
the latest version should  work in most cases. At least there won't be any new versions 
of these libraries on the classpath.  

##Usage

to create a jar with necessary dependencies, just use the fatjar task in the gradle 
build:

`gb01-java$ ./gradlew fatjar`

##Notes

This is by no means the only method to achieve this, nor is it guaranteed to work for 
all cases (merging contents from META-INF directories is a possible issue). It should 
cope with most cases and should be used for consistency wherever possible.  

Where dependencies in build.gradle have a variable rather than a version number (e.g. 
${mocaCoreVersion}) the variable can be resolved in the gradle.properties file.