const { buildModule } = require('@nomicfoundation/hardhat-ignition/modules');

const Module = buildModule('MonsteraModule', (m) => {
  const monsteraToken = m.contract('Monstera');

  return { monsteraToken };
});

module.exports = Module;
