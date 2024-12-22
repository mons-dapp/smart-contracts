import { expect } from 'chai';
import hre from 'hardhat';
import { loadFixture } from '@nomicfoundation/hardhat-toolbox/network-helpers';

describe('Monstera contract', async () => {
  const deployTokenFixture = async () => {
    const [owner, address1, address2] = await hre.ethers.getSigners();
    const MonsToken = await hre.ethers.getContractFactory('Monstera');
    const hardhatToken = await MonsToken.deploy(); // deploy to hardhat blockchain test

    return { MonsToken, hardhatToken, owner, address1, address2 };
  };

  it('Deployment should assign total supply of tokens to owner', async () => {
    const { hardhatToken, owner } = await loadFixture(deployTokenFixture);

    const ownerBalance = await hardhatToken.balanceOf(owner.address);
    expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
  });

  it('Should transfer tokens between accounts', async () => {
    const { MonsToken, hardhatToken, owner, address1, address2 } =
      await loadFixture(deployTokenFixture);

    // Transfer 100 tokens to address 1
    await hardhatToken.transfer(address1.address, 100);
    expect(await hardhatToken.balanceOf(address1.address)).to.equal(100);

    // Transfer 50 tokens from address 1 to address 2
    await hardhatToken.connect(address1).transfer(address2.address, 50);
    expect(await hardhatToken.balanceOf(address2.address)).to.equal(50);
  });
});
