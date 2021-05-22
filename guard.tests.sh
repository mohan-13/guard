testExitCodeToBeTwoWhenPathIsNotSpecified(){
    ./guard.sh > /dev/null
    assertEquals $? 2
}
