Generators -- manual/generators/test\_framework.markdown
{: .document-title}


## Usage

    

    rails generate hobo:test_framework NAME [options]


## Options

    

        [--fixture-replacement=FIXTURE_REPLACEMENT]  # Use a specific fixture replacement
        [--skip-namespace]                           # Skip namespace (affects only isolated applications)
    -t, [--test-framework=TEST_FRAMEWORK]            # Use a specific test framework
                                                     # Default: test_unit
        [--old-style-hash]                           # Force using old style hash (:foo => 'bar') on Ruby >= 1.9
        [--update]                                   # Run bundle update to install the missing gems
        [--fixtures]                                 # Add the fixture option to the test framework
                                                     # Default: true


## Runtime options

    

    -p, [--pretend]  # Run but do not make any changes
    -s, [--skip]     # Skip files that already exist
    -q, [--quiet]    # Supress status output
    -f, [--force]    # Overwrite files that already exist


## Description

    

      Create hobo files for test_framework generator.
