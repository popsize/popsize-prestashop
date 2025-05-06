{if $partner_id}
    <link rel="stylesheet" href="https://engine.popsize.ai/latest/static/css/main.latest.css" />
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var script = document.createElement("script");
            script.src = "https://engine.popsize.ai/latest/static/js/main.latest.js";
            script.setAttribute("data-partner-id", "{$partner_id}");
            document.body.appendChild(script);
        });
    </script>
{/if}
