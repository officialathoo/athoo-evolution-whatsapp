FROM evoapicloud/evolution-api:v2.3.7

# Evolution API v2.3.7 ships with an older Baileys runtime. Patch only the
# Baileys runtime dependency while keeping Evolution itself on the stable 2.3.7
# line and preserving the same API contracts used by Athoo backend OTP delivery.
# Important: npm publishes this RC as 7.0.0-rc13, not 7.0.0-rc.13.
RUN npm install --no-save --ignore-scripts baileys@7.0.0-rc13 \
    && node -e "const p=require('./node_modules/baileys/package.json'); if (p.version !== '7.0.0-rc13') { throw new Error('Unexpected Baileys version: ' + p.version) }"

EXPOSE 8080
