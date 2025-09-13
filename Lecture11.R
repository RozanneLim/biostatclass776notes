#Lecture 11: ggplot2
#Date: 09/11/2025

g <- maacs %>%
  ggplot(aes(logpm25, NocturnalSympt))
g + geom_point()

ggplot(penguins) +
  geom_point(
    mapping = aes(x = flipper_length_mm, y = bill_length_mm, color = species)
  ) +
  geom_smooth(
    mapping = aes(x = flipper_length_mm, y = bill_length_mm, color = species),
    method = 'lm'
  ) +
  theme_dark()
