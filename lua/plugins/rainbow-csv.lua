-- rainbow_csv is a rainbow_csv integration
-- https://github.com/cameron-wags/rainbow_csv.nvim

return {
  'cameron-wags/rainbow_csv.nvim',
  cmd = {
    'RainbowDelim',
    'RainbowDelimSimple',
    'RainbowDelimQuoted',
    'RainbowMultiDelim',
  },
  ft = {
    'csv',
    'tsv',
    'csv_semicolon',
    'csv_whitespace',
    'csv_pipe',
    'rfc_csv',
    'rfc_semicolon',
  },
  config = true,
}
