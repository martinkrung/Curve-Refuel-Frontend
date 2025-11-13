# ⚡ Quick Deploy Guide

Want to deploy and get a live URL in minutes? Follow these steps!

## 🎯 What You'll Get

- ✅ Live website URL (e.g., `https://your-app.vercel.app`)
- ✅ Deployed smart contracts on Sepolia testnet
- ✅ Interactive UI to test your Refuel interfaces
- ✅ Automatic deployments on every push

## 🚀 3-Step Deployment

### Step 1: Set Up Vercel (2 minutes)

1. Go to **[vercel.com](https://vercel.com)** and sign in with GitHub
2. Click **"Add New Project"**
3. Import **`martinkrung/Curve-Refuel-Frontend`**
4. Set Root Directory: **`packages/nextjs`**
5. Click **"Deploy"** (will fail - that's OK!)

### Step 2: Configure Secrets (3 minutes)

Go to your GitHub repository settings:
```
https://github.com/martinkrung/Curve-Refuel-Frontend/settings/secrets/actions
```

Add these 5 secrets (click "New repository secret" for each):

| Secret Name | Where to Get It |
|-------------|-----------------|
| `VERCEL_TOKEN` | [Vercel Account → Settings → Tokens](https://vercel.com/account/tokens) |
| `VERCEL_ORG_ID` | Run: `vercel link` then `cat .vercel/project.json` |
| `VERCEL_PROJECT_ID` | Same as above |
| `NEXT_PUBLIC_ALCHEMY_API_KEY` | [Alchemy Dashboard](https://dashboard.alchemy.com/) → Create App (Sepolia) |
| `DEPLOYER_PRIVATE_KEY` | MetaMask → Account Details → Export Private Key |

⚠️ **Never commit private keys!** Only add them as GitHub secrets.

### Step 3: Deploy! (1 minute)

#### Option A: Automatic (Recommended)
Just push to your branch:
```bash
git push origin your-branch-name
```

GitHub Actions will automatically deploy everything!

#### Option B: Manual Deploy
1. Go to **[Actions tab](https://github.com/martinkrung/Curve-Refuel-Frontend/actions)**
2. Click **"Deploy to Vercel"**
3. Click **"Run workflow"**
4. Wait ~2 minutes
5. Get your URL from the workflow output!

## 🎉 You're Live!

Your app will be available at: **`https://your-project.vercel.app`**

Find your exact URL in:
- GitHub Actions → Deploy to Vercel → Summary
- Vercel Dashboard → Your Project → Domains

## 📱 How to Use Your Live App

1. **Open your Vercel URL**
2. **Connect MetaMask**
3. **Switch to Sepolia network** (get free ETH from [Sepolia Faucet](https://www.alchemy.com/faucets/ethereum-sepolia))
4. **Interact with your contracts** through the Debug Contracts page!

## 🐛 Troubleshooting

**Deployment fails?**
- Check if all 5 secrets are set correctly
- View detailed logs in GitHub Actions

**Need help?**
- See full guide: [DEPLOYMENT.md](./DEPLOYMENT.md)
- Check GitHub Actions logs
- Verify Alchemy API key works

## 📚 Next Steps

- **Deploy contracts**: Use "Deploy Contracts to Sepolia" workflow
- **Customize UI**: Edit files in `packages/nextjs`
- **Add features**: Modify contracts in `packages/hardhat/contracts`

## 🔗 Useful Links

- [Vercel Dashboard](https://vercel.com/dashboard)
- [GitHub Actions](https://github.com/martinkrung/Curve-Refuel-Frontend/actions)
- [Alchemy Dashboard](https://dashboard.alchemy.com/)
- [Sepolia Faucet](https://www.alchemy.com/faucets/ethereum-sepolia)
- [Sepolia Explorer](https://sepolia.etherscan.io/)

---

**That's it!** You now have a live dApp with automatic deployments. 🎊
