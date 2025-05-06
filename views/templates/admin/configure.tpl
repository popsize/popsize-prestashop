<form action="index.php?controller=AdminModules&configure=popsize" method="post">
    <input type="hidden" name="token" value="{$token}" />
    <label for="PARTNER_ID">Partner ID:</label>
    <input type="text" name="PARTNER_ID" id="PARTNER_ID" value="{$partner_id}" required />
    <input type="submit" name="savePopsizeConfig" value="Save" class="button" />
</form>
