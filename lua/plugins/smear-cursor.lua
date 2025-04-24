-- smear-curor animates the cursor with a smear effect
-- https://github.com/sphamba/smear-cursor.nvim

return {
  'sphamba/smear-cursor.nvim',
  opts = {
    stiffness = 0.55, -- 0.6      [0, 1]
    trailing_stiffness = 0.5, -- 0.4      [0, 1]
    stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
    trailing_stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
    distance_stop_animating = 0.5, -- 0.1      > 0
  },
}
