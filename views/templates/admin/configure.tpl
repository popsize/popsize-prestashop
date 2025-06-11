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
<form action="index.php?controller=AdminModules&configure=popsize" method="post">
    <input type="hidden" name="token" value="{$token}" />
    <label for="PARTNER_ID">Partner ID:</label>
    <input type="text" name="PARTNER_ID" id="PARTNER_ID" value="{$partner_id}" required />
    <input type="submit" name="savePopsizeConfig" value="Save" class="button" />
</form>
