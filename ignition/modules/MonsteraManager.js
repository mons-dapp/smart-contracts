const { buildModule } = require('@nomicfoundation/hardhat-ignition/modules');

const Module = buildModule('MonsteraManagerModule', (m) => {
  const monsteraManager = m.contract('MonsteraManager');

  return { monsteraManager };
});

module.exports = Module;
