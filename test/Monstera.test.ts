import { expect } from 'chai';
import hre from 'hardhat';

describe('Monstera contract', async () => {
  let owner: string;
  let hardhatToken: any;

  beforeEach(async () => {
    const [signer] = await hre.ethers.getSigners();
    owner = signer.address;
    const MonsToken = await hre.ethers.getContractFactory('Monstera');
    hardhatToken = await MonsToken.deploy();
  });

  it('check the owner balance', async () => {
    const ownerBalance = await hardhatToken.balanceOf(owner);
    expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
  });
});
