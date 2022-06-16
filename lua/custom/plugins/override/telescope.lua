return {
  defaults = {
    prompt_prefix = " 什  ",
    -- prompt_prefix = "  ",
    selection_caret = ' ',
    -- selection_caret = ' ➛ ',
    layout_config = {
      width = 0.9,
      height = 0.85,
      preview_cutoff = 30,
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      }
    }
  }
}
