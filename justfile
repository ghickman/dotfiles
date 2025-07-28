# list available commands
default:
    @{{ just_executable() }} --list

# update habits datafile
@habits:
    strfile habits/habits habits/habits.dat
