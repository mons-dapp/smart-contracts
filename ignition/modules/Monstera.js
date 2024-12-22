const { buildModule } = require('@nomicfoundation/hardhat-ignition/modules');

const TokenModule = buildModule('MonsteraModule', (m) => {
  const token = m.contract('Monstera');

  return { token };
});

module.exports = TokenModule;
