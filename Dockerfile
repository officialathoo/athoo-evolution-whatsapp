FROM evoapicloud/evolution-api:v2.3.7

# Evolution API v2.3.7 ships with Baileys 7.0.0-rc.9. Current upstream
# reports show outgoing private-message failures on rc.9 that are resolved
# by replacing only Baileys with rc.13. Keep Evolution itself on the stable
# 2.3.7 line and patch the runtime dependency without changing API contracts.
RUN npm install --no-save --ignore-scripts baileys@7.0.0-rc.13 \
    && node -e "const p=require('./node_modules/baileys/package.json'); if (p.version !== '7.0.0-rc.13') { throw new Error('Unexpected Baileys version: ' + p.version) }"

EXPOSE 8080
