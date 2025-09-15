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
    <link rel="stylesheet" href="https://engine.popsize.ai/latest/button.css" crossorigin="anonymous"/>
    <script>
        (function () {
            function addWidgetContainer() {
                var target = document.querySelector('.product-variants');
                if (target) {
                    var widgetContainer = document.createElement('div');
                    widgetContainer.id = 'popsize-widget-container';
                    target.parentNode.insertBefore(widgetContainer, target);
                }
            }

            if (document.readyState === 'loading') {
                // DOM is still loading, attach the event listener
                document.addEventListener('DOMContentLoaded', addWidgetContainer);
            } else {
                // DOM is already loaded, execute immediately
                addWidgetContainer();
            }
        })();
    </script>
    <script src="https://engine.popsize.ai/latest/button.js" data-partner-id="{$partner_id}"></script>
{/if}
