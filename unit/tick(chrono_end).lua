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
	   animation: bounce 0.65s ease infinite alternate;
        position: absolute;
    }
    @keyframes bounce{
     from {top: 50px;}
     50%  {top: 86px;}
     to   {top: 106px;}
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
	   color:green;
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
	   transform: rotate(360deg);
    }

    .pie-wrapper.progress-30 .pie .half-circle {
        border-color: #3498db;
    }

    .pie-wrapper.progress-30 .pie .left-side {
        transform: rotate(180deg);
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
        <span class="label"><br>Scan<br>Completed</span>
        <div class="pie">
            <div class="left-side half-circle"></div>
            <div class="right-side half-circle"></div>
        </div>
    </div>
</div>
]]
system.setScreen(html)
if timer_wakeup_sound then
    if system.isPlayingSound()==0 then
        system.playSound("ts_complete.mp3")
    end
end    
