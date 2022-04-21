# type: a

import sys

flags = {}

args = sys.argv
args.pop(0)

def get_multi_var_flags():
    cflag = None
    coptions = []

    for arg in args:
        if arg[0] == '-':
            if cflag is not None:
                flags[cflag] = coptions
                coptions = []

            cflag = arg

        else:
            if cflag is not None:
                coptions.append(arg)

    if cflag is not None:
        flags[cflag] = coptions

    return(flags)

def is_flag(arg):
    if arg is None:
        return(False)
    return(arg[0] == '-')

def get_flags():
    args.append("--")
    flags = {}
    
    for n, arg in enumerate(args):
        if arg == "--":
            break
        elif is_flag(arg):
            next_arg = args[n + 1]
            if is_flag(next_arg):
                flags[arg] = None
                args[n] = None
            else:
                flags[arg] = next_arg
                args[n] = None
                args[n + 1] = None


    options = []

    for arg in args:
        if arg is not None and arg != "--":
            options.append(arg)
    flags['options'] = options

    return(flags)



if __name__ == "__main__":
    print(get_flags())
