timer_duration=10
chronostart = -1
deg_r = 0
deg_l = 0
clip_css = "clip: rect(0, 1em, 1em, 0.5em);"
dis_css = "display: none;"
function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end
