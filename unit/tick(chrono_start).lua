if chronostart < 0 then
    chronostart = system.getTime()
end    
time_left = (timer_duration-(system.getTime()-chronostart))
time_spent = (system.getTime()-chronostart)

if time_spent<=(timer_duration/2) then
	deg_r=time_spent*(360/timer_duration)
end
if time_spent>timer_duration/2 then
    deg_r = 180
end    
if time_spent>(timer_duration/2) then
	deg_l=time_spent*(360/timer_duration)
     clip_css=""
     dis_css=""
end
if deg_l > 360 then
    deg_l = 360
end

-- MINUTES (60 seconds are 1 minute) 
local minutes = time_left // 60
-- Modulus again to get minutes lefts
time_left = time_left % 60
local seconds = time_left
formated_time = ""
if round(minutes,0) > 0 then
    formated_time = formated_time..round(minutes,0).." min<br>"
end    
formated_time = "<br>Scan<br>"..formated_time..round(seconds,0).. "s"

if time_spent>timer_duration then
    unit.stopTimer("chrono_start")
    done = true
    unit.setTimer("chrono_end",1)
    formated_time = "<br>Scan<br>Completed"
end    

html = [[<style>
    *,
    *:before,
    *:after {
        box-sizing: border-box;
    }

    html,
    body {
        color: #444;
        font-family: 'Lato', Tahoma, Geneva, sans-serif;
        font-size: 16px;
        padding: 10px;
    }

    .set-size {
        font-size: 10em;
    }

    .charts-container:after {
        clear: both;
        content: "";
        display: table;
    }

    .pie-wrapper {
        height: 1em;
        width: 1em;
        float: left;
        margin: 15px;
        position: relative;
    }

    .pie-wrapper:nth-child(3n+1) {
        clear: both;
    }

    .pie-wrapper .pie {
        height: 100%;
        width: 100%;
        ]]..clip_css..[[
        left: 0;
        position: absolute;
        top: 0;
    }

    .pie-wrapper .pie .half-circle {
        height: 100%;
        width: 100%;
        border: 0.1em solid #3498db;
        border-radius: 50%;
        clip: rect(0, 0.5em, 1em, 0);
        left: 0;
        position: absolute;
        top: 0;
    }

    .pie-wrapper .label {
        background: #34495e;
        border-radius: 50%;
        bottom: 0.4em;
        color: #ecf0f1;
        cursor: default;
        display: block;
        font-size: 2vh;
        left: 0.4em;
        line-height: 3vh;
        position: absolute;
        right: 0.4em;
        text-align: center;
        top: 0.4em;
    }

    .pie-wrapper .label .smaller {
        color: #bdc3c7;
        font-size: .45em;
        padding-bottom: 20px;
        vertical-align: super;
    }

    .pie-wrapper .shadow {
        height: 100%;
        width: 100%;
        border: 0.1em solid #bdc3c7;
        border-radius: 50%;
    }

    .pie-wrapper.style-2 .label {
        background: none;
        color: #7f8c8d;
    }

    .pie-wrapper.style-2 .label .smaller {
        color: #bdc3c7;
    }

    .pie-wrapper.progress-30 .pie .right-side {
        ]]..dis_css..[[
	   transform: rotate(]]..deg_l..[[deg);
    }

    .pie-wrapper.progress-30 .pie .half-circle {
        border-color: #3498db;
    }

    .pie-wrapper.progress-30 .pie .left-side {
        transform: rotate(]]..deg_r..[[deg);
    }

    .pie-wrapper--solid {
        border-radius: 50%;
        overflow: hidden;
    }

    .pie-wrapper--solid:before {
        border-radius: 0 100% 100% 0%;
        content: '';
        display: block;
        height: 100%;
        margin-left: 50%;
        transform-origin: left;
    }

    .pie-wrapper--solid .label {
        background: transparent;
    }


</style>
<div class="set-size charts-container">
    <div class="pie-wrapper progress-30">
        <span class="label">]]..formated_time..[[</span>
        <div class="pie">
            <div class="left-side half-circle"></div>
            <div class="right-side half-circle"></div>
        </div>
    </div>
</div>
]]
system.setScreen(html)
