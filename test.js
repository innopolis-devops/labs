const getCallMe  = () => {
    let numberOfFunctionCalls = 0
    return () => {
        numberOfFunctionCalls += 1;
        console.log('I am called')
        if (numberOfFunctionCalls > 3) console.log('Stop')
    }
}

const foo = getCallMe()

foo()
foo()
foo()
foo()