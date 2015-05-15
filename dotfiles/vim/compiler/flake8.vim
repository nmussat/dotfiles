if exists('current_compiler')
    finish
endif
let current_compiler = 'flake8'
CompilerSet makeprg=flake8\ --format=pylint\ %
CompilerSet efm=%A%f:%l:\ [%t%.%#]\ %m,%Z%p^^,%-C%.%#,%-GNo%.%#
