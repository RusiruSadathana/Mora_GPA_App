# GitHub Actions CI/CD Workflows

This directory contains automated workflows for building and releasing the Mora GPA Android app.

## Workflows

### 1. Build APK (`build-apk.yml`)

**Triggers:**
- Push to `main`, `master`, `develop`, or any `claude/**` branch
- Pull requests to `main`, `master`, or `develop`
- Manual trigger via GitHub Actions UI

**What it does:**
- Builds debug APK on every push/PR
- Runs tests (if available)
- Uploads APK artifacts for download
- Provides build summary

**Artifacts:**
- Debug APK: Available for 30 days
- Release APK: Available for 90 days (unsigned if no keystore configured)

### 2. Release (`release.yml`)

**Triggers:**
- Pushing a version tag (e.g., `v1.0.0`, `v2.1.3`)
- Manual trigger via GitHub Actions UI

**What it does:**
- Builds signed release APK (if keystore is configured)
- Builds App Bundle (AAB) for Play Store
- Creates GitHub Release with downloadable files
- Generates SHA256 checksums for verification

## Setup Instructions

### For Regular Builds (Unsigned)

No setup required! Push code and workflows will run automatically.

### For Signed Release Builds

To build signed APKs for production, configure these GitHub Secrets:

1. Go to your repository Settings → Secrets and variables → Actions
2. Add the following secrets:

| Secret Name | Description | How to Get |
|-------------|-------------|------------|
| `KEYSTORE_BASE64` | Base64-encoded keystore file | See below |
| `KEYSTORE_PASSWORD` | Keystore password | Your keystore password |
| `KEY_ALIAS` | Key alias | Your key alias |
| `KEY_PASSWORD` | Key password | Your key password |

#### Creating and Encoding Your Keystore

If you don't have a keystore yet:

```bash
# Generate a new keystore
keytool -genkey -v -keystore mora-gpa.jks -keyalg RSA -keysize 2048 -validity 10000 -alias mora-gpa

# Encode it to base64
base64 mora-gpa.jks > keystore.base64

# Copy the contents of keystore.base64 and add as KEYSTORE_BASE64 secret
```

If you already have a keystore:

```bash
# Encode your existing keystore
base64 your-keystore.jks > keystore.base64

# Copy the contents and add as KEYSTORE_BASE64 secret
```

## Usage

### Building Debug APKs

Simply push your code:

```bash
git add .
git commit -m "Your changes"
git push
```

The workflow will automatically build and upload APK artifacts.

### Creating a Release

1. **Update version in pubspec.yaml:**
   ```yaml
   version: 1.0.0+1
   ```

2. **Commit and tag:**
   ```bash
   git add pubspec.yaml
   git commit -m "Bump version to 1.0.0"
   git tag v1.0.0
   git push origin main
   git push origin v1.0.0
   ```

3. **Or manually trigger:**
   - Go to Actions tab
   - Select "Release APK" workflow
   - Click "Run workflow"
   - Enter version number

### Downloading APKs

**From Workflow Runs:**
1. Go to Actions tab
2. Click on a workflow run
3. Scroll to "Artifacts" section
4. Download the APK

**From Releases:**
1. Go to Releases section
2. Find your version
3. Download APK or AAB files

## Workflow Status Badges

Add these to your README.md:

```markdown
![Build APK](https://github.com/YOUR_USERNAME/Mora_GPA_App/workflows/Build%20Android%20APK/badge.svg)
![Release](https://github.com/YOUR_USERNAME/Mora_GPA_App/workflows/Release%20APK/badge.svg)
```

## Troubleshooting

### Build Fails

**Check:**
- Java version is compatible (JDK 17)
- Flutter version matches your pubspec.yaml
- Dependencies are properly specified

**View Logs:**
1. Go to Actions tab
2. Click failed workflow
3. Expand failed step to see detailed logs

### Unsigned APK in Release

If your release APK is unsigned:
- Verify all 4 keystore secrets are correctly set
- Check secret names match exactly
- Ensure keystore file is properly base64 encoded

### Cannot Install APK

**On Android device:**
1. Enable "Install from Unknown Sources"
2. Ensure minimum Android version is met
3. Check available storage space

## Security Notes

- Never commit keystore files to git
- Keep passwords in GitHub Secrets only
- Keystore files are automatically cleaned up after builds
- Use separate keystores for debug and release builds

## Additional Resources

- [Flutter Build Documentation](https://docs.flutter.dev/deployment/android)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Android App Signing](https://developer.android.com/studio/publish/app-signing)
