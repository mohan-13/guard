# Guard 
Gaurd is shell script utility develpoed to scan for potential secrets in a directory which has Git Repos.

## Prerequiste
Guard uses git to find and scan for secrets. Make sure you have git installed.

## Setting Up
Guard uses an YML file with a list of patterns with each pattern on a new line. 
Create and add your patterns to ~/.guard/patterns.yml

>``` mkdir ~/.guard && nano ~/.guard/patterns.yml ```

This will create the patterns file and open an editor for you.

Example Patterns: 

```
AWS_ACCESS_KEY
AWS_SECRET_KEY
.*SECRET_KEY.*
.*PASSWORD.* 
```

Now that you have patterns ready.

Clone the guard repo in your machine.
> git clone https://github.com/mohan-13/guard.git

Executing guard:

You can run guard directly from the cloned directory by 
>``` ./guard . ```

where . represents current directory. You can pass any directory you want to scan.

If you want guard to be globally accessible across your machine either add your cloned folder to your $PATH variable or move guard.sh to one your previous paths.

Adding to path variable: ``` export PATH=$PATH:\<cloned folder path> ```

Copying to a previous path : ``` cp guard /usr/local/bin/guard ```


## Running Unit Tests:
Guard uses shunit to run tests

Install shunit2 : ``` apt-get install shunit2 ```

Run the tests : ``` shunit2 guard.tests.sh ```
