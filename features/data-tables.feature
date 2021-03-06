Feature: Data tables
  Scenario: Data table manipulation
    Given a new toyplot.data.table
    Then adding columns should change the table
    And extracting columns should return a new table
    And deleting columns should change the table
    And indexing should return a new table with one row
    And slicing should return a new table with a range of rows
    And extracting rows by index should return a new table with one row
    And extracting rows using multiple indices should return a new table with the specified rows
    And new columns must have a string name
    And new columns must have the same number of rows as existing columns
    And new columns must be one-dimensional
    And per-column metadata can be specified

  Scenario Outline: Data table creation
    When toyplot.data.Table is initialized with <input>
    Then the toyplot.data.Table <response>

    Examples:
      | input                             | response                            |
      | nothing                           | is empty                            |
      | a toyplot.data.Table              | contains the columns                |
      | an OrderedDict containing columns | contains the columns                |
      | a dict containing columns         | contains the columns, sorted by key |

  Scenario Outline: Data table rendering
    Given a toyplot.data.table with some data
    Then the table can be rendered as format <format>

    Examples:
      | format                  |
      | latex string            |
      | latex fobj              |
      | latex file              |
      | latex string with hline |
      | ipython html string     |
