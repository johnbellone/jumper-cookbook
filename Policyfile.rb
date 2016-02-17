name 'jumper'
default_source :community
cookbook 'jumper', path: '.'
run_list 'jumper::default'
