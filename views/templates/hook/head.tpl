{**
 * Copyright since 2025 POPSIZE and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is licensed under the GNU Affero General Public License v3.0
 * that is bundled with this package in the file LICENSE.md.
 * It is also available at:
 * https://www.gnu.org/licenses/agpl-3.0.html
 * If you did not receive a copy of the license and cannot
 * obtain it, please email contact@popsize.ai.
 *
 * @author    POPSIZE and Contributors <contact@popsize.ai>
 * @copyright Since 2025 POPSIZE and Contributors
 * @license   https://www.gnu.org/licenses/agpl-3.0.html GNU Affero General Public License v3.0
 *}
{if $partner_id}
    <link rel="stylesheet" href="https://engine.popsize.ai/latest/static/css/main.latest.css" crossorigin="anonymous"/>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var script = document.createElement("script");
            script.src = "https://engine.popsize.ai/latest/static/js/main.latest.js";
            script.setAttribute("data-partner-id", "{$partner_id}");
            document.body.appendChild(script);
        });
    </script>
{/if}
