# 🚀 Deployment Guide

This guide will help you deploy your Scaffold-ETH 2 application with the Refuel interfaces to a live URL.

## Prerequisites

1. **GitHub Account** - Your code is already on GitHub
2. **Vercel Account** - Sign up at [vercel.com](https://vercel.com) (free tier is sufficient)
3. **Alchemy Account** - Sign up at [alchemy.com](https://www.alchemy.com/) for RPC endpoints
4. **Sepolia ETH** - Get free testnet ETH from [Sepolia Faucet](https://www.alchemy.com/faucets/ethereum-sepolia)

## 📋 Deployment Steps

### Step 1: Set Up Vercel

1. **Go to [vercel.com](https://vercel.com)** and sign in with GitHub
2. **Click "Add New Project"**
3. **Import your repository**: `martinkrung/Curve-Refuel-Frontend`
4. **Configure Project:**
   - Framework Preset: `Next.js`
   - Root Directory: `packages/nextjs`
   - Build Command: `yarn build`
   - Output Directory: `.next`
5. **Click "Deploy"** (it will fail first time - that's expected!)

### Step 2: Get Your Vercel Credentials

1. **Install Vercel CLI** locally:
   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel:**
   ```bash
   vercel login
   ```

3. **Link your project:**
   ```bash
   cd Curve-Refuel-Frontend
   vercel link
   ```

4. **Get your credentials:**
   ```bash
   # Get Organization ID
   cat .vercel/project.json | grep orgId

   # Get Project ID
   cat .vercel/project.json | grep projectId
   ```

5. **Create a Vercel Token:**
   - Go to [Vercel Account Settings > Tokens](https://vercel.com/account/tokens)
   - Click "Create Token"
   - Name it "GitHub Actions"
   - Copy the token (you'll only see it once!)

### Step 3: Get Alchemy API Key

1. **Sign up at [Alchemy](https://www.alchemy.com/)**
2. **Create a new app:**
   - Click "Create new app"
   - Chain: **Ethereum**
   - Network: **Sepolia**
   - Name: "Curve Refuel"
3. **Copy your API Key** from the dashboard

### Step 4: Configure GitHub Secrets

1. **Go to your GitHub repository:**
   ```
   https://github.com/martinkrung/Curve-Refuel-Frontend/settings/secrets/actions
   ```

2. **Add the following secrets** (click "New repository secret"):

   | Secret Name | Value | Where to Get It |
   |-------------|-------|-----------------|
   | `VERCEL_TOKEN` | Your Vercel token | From Step 2.5 |
   | `VERCEL_ORG_ID` | Your org ID | From Step 2.4 |
   | `VERCEL_PROJECT_ID` | Your project ID | From Step 2.4 |
   | `NEXT_PUBLIC_ALCHEMY_API_KEY` | Your Alchemy API key | From Step 3.3 |
   | `DEPLOYER_PRIVATE_KEY` | Your wallet private key | From MetaMask (export private key) |

   ⚠️ **SECURITY WARNING:** Never commit private keys to GitHub! Only add them as secrets.

### Step 5: Deploy Contracts to Sepolia

1. **Get Sepolia ETH** from [faucet](https://www.alchemy.com/faucets/ethereum-sepolia)

2. **Deploy via GitHub Actions:**
   - Go to the "Actions" tab in your repository
   - Click on "Deploy Contracts to Sepolia" workflow
   - Click "Run workflow"
   - Select your branch
   - Click "Run workflow" button

   OR manually deploy locally:
   ```bash
   cd packages/hardhat
   yarn deploy --network sepolia
   ```

### Step 6: Deploy Frontend to Vercel

Once GitHub secrets are configured, the deployment is automatic:

1. **Push any code** to your branch:
   ```bash
   git push origin your-branch-name
   ```

2. **GitHub Actions will automatically:**
   - Compile your contracts
   - Deploy to Vercel
   - Give you a live URL in the Actions output

3. **View your deployment:**
   - Go to the "Actions" tab
   - Click on the latest "Deploy to Vercel" workflow run
   - Check the summary for your live URL

## 🌐 Your Live URLs

After successful deployment, you'll have:

- **Frontend URL**: `https://your-project.vercel.app`
- **Deployed Contracts on Sepolia**: Check [Sepolia Etherscan](https://sepolia.etherscan.io/)

## 🎯 How to Use Your Deployed App

1. **Open your Vercel URL** in a browser
2. **Connect your MetaMask wallet**
3. **Switch to Sepolia network** in MetaMask
4. **Interact with your contracts** through the UI

## 🔧 Quick Deploy (One Command)

If you have everything set up, you can trigger deployment with:

```bash
# From the repository root
git push origin main
```

This will automatically:
- ✅ Compile contracts
- ✅ Run tests
- ✅ Deploy frontend to Vercel
- ✅ Give you a live URL

## 📱 Alternative: Deploy to IPFS

If you prefer decentralized hosting:

```bash
cd packages/nextjs
yarn ipfs
```

This will deploy to IPFS and give you a permanent, decentralized URL.

## 🐛 Troubleshooting

### Deployment fails
- Check GitHub Actions logs for detailed error messages
- Verify all secrets are correctly set
- Ensure you have Sepolia ETH in your deployer wallet

### Can't connect wallet
- Make sure you're on Sepolia network
- Check that contracts are deployed to Sepolia
- Verify Alchemy API key is correct

### Contracts not showing
- Redeploy contracts: `yarn deploy --network sepolia`
- Check `packages/nextjs/contracts` for generated contract files

## 📚 Additional Resources

- [Scaffold-ETH 2 Docs](https://docs.scaffoldeth.io)
- [Vercel Docs](https://vercel.com/docs)
- [Alchemy Docs](https://docs.alchemy.com/)
- [Sepolia Faucet](https://www.alchemy.com/faucets/ethereum-sepolia)

## 🎉 Success Checklist

- [ ] Vercel account created
- [ ] GitHub secrets configured
- [ ] Alchemy API key obtained
- [ ] Contracts deployed to Sepolia
- [ ] Frontend deployed to Vercel
- [ ] Live URL accessible
- [ ] Wallet connects successfully
- [ ] Can interact with contracts

---

**Need help?** Check the GitHub Actions logs or open an issue in the repository.
