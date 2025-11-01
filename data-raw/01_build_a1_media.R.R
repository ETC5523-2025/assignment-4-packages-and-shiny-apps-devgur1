# data-raw/01_build_a1_media.R
# Author: Dev Karan Gur
# Source: ETC5523 Assignment 1 – Breaking Down Articles

library(tibble)

a1_media <- tibble::tibble(
  piece = c(
    "Amazon delivery hubs (The Guardian)",
    "How Many People Can You Remember? (FiveThirtyEight)",
    "Australia’s housing market explainer (The Guardian)"
  ),
  medium = c("print_investigation", "blog_visual", "video_explainer"),
  focus = c(
    "Environmental justice, air pollution, community data",
    "Human memory capacity and social network size",
    "Housing affordability and policy complexity"
  ),
  lede_style = c(
    "formal news lede with visual contrast",
    "Dear-letter conversational hook",
    "direct question framing"
  ),
  main_result = c(
    "PM2.5 rose 17%→45%; 3,900 trucks/day; regulatory solutions proposed",
    "Stable ties ≈150; recall expands with cues (3k–4k names possible)",
    "Negative gearing + CGT + supply limits = affordability crisis"
  ),
  evidence_mode = c(
    "citizen sensors + interviews + zoning data",
    "experimental studies + cues + hand-drawn data art",
    "tax data + planning visuals + narration"
  ),
  key_takeaway = c(
    "Shows data inequality and the role of citizen science in accountability",
    "Shows how framing and cues alter what audiences recall",
    "Shows that policy mix, not single villains, drives housing outcomes"
  )
)

usethis::use_data(a1_media, overwrite = TRUE)

