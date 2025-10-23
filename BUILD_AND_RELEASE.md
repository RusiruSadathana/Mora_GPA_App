# Building and Releasing Mora GPA App

This guide explains how to build and release the Mora GPA Calculator app using the automated GitHub Actions CI/CD pipelines.

## 🚀 Quick Start

### Option 1: Automatic Build (Recommended)

Simply push your code to trigger automatic builds:

```bash
git push origin your-branch-name
```

The CI/CD pipeline will automatically:
- ✅ Build debug and release APKs
- ✅ Run tests
- ✅ Upload artifacts for download

### Option 2: Manual Local Build

If you have Flutter installed locally:

```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release

# App Bundle for Play Store
flutter build appbundle --release
```

## 📦 Getting Your APK

### From GitHub Actions

1. Go to your repository on GitHub
2. Click on **Actions** tab
3. Select the latest successful workflow run
4. Scroll down to **Artifacts** section
5. Download the APK file

**APK Locations in Artifacts:**
- Debug: `mora-gpa-debug-{commit-hash}`
- Release: `mora-gpa-release-{commit-hash}`

### From GitHub Releases

1. Go to **Releases** section on GitHub
2. Find the version you want
3. Download the APK or AAB file
4. Files include SHA256 checksums for verification

## 🏷️ Creating a Release

### Method 1: Using Git Tags

```bash
# 1. Update version in pubspec.yaml
version: 1.2.0+3

# 2. Commit the change
git add pubspec.yaml
git commit -m "Bump version to 1.2.0"

# 3. Create and push tag
git tag v1.2.0
git push origin main
git push origin v1.2.0
```

The release workflow will automatically:
- Build signed APK (if configured)
- Build App Bundle (AAB)
- Create GitHub Release
- Upload all artifacts
- Generate checksums

### Method 2: Manual Trigger

1. Go to **Actions** tab on GitHub
2. Select **Release APK** workflow
3. Click **Run workflow**
4. Enter version number (e.g., `v1.2.0`)
5. Click **Run workflow** button

## 🔐 Setting Up Signed Releases

For production releases, you need to configure signing credentials.

### Step 1: Generate or Prepare Keystore

**If you don't have a keystore:**

```bash
keytool -genkey -v -keystore mora-gpa.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias mora-gpa
```

**Answer the prompts:**
- Name, organization, location, etc.
- Keystore password (save this!)
- Key password (save this!)

### Step 2: Encode Keystore to Base64

```bash
# On Linux/Mac
base64 mora-gpa.jks > keystore.base64

# On Windows (PowerShell)
[Convert]::ToBase64String([IO.File]::ReadAllBytes("mora-gpa.jks")) > keystore.base64
```

### Step 3: Add GitHub Secrets

1. Go to repository **Settings** → **Secrets and variables** → **Actions**
2. Click **New repository secret**
3. Add these 4 secrets:

| Secret Name | Value | Example |
|-------------|-------|---------|
| `KEYSTORE_BASE64` | Content of keystore.base64 file | MIIKf...base64... |
| `KEYSTORE_PASSWORD` | Your keystore password | MyStrongPassword123! |
| `KEY_ALIAS` | Your key alias | mora-gpa |
| `KEY_PASSWORD` | Your key password | MyKeyPassword123! |

### Step 4: Test Signed Build

Create a test release:

```bash
git tag v1.0.0-test
git push origin v1.0.0-test
```

Check Actions to verify signing works!

## 📱 Installing APK on Android

### For Testing (Debug APK)

1. Download the debug APK
2. Transfer to your Android device
3. Open the APK file
4. If prompted, enable "Install from Unknown Sources"
5. Tap Install

### For Distribution (Release APK)

**Direct Installation:**
- Same steps as debug APK
- Users need "Unknown Sources" enabled

**Play Store (AAB file):**
1. Download the AAB file from release
2. Go to [Google Play Console](https://play.google.com/console)
3. Upload the AAB file
4. Complete store listing
5. Submit for review

## 🔄 Version Numbering

Follow semantic versioning in `pubspec.yaml`:

```yaml
version: MAJOR.MINOR.PATCH+BUILD

# Examples:
version: 1.0.0+1   # Initial release
version: 1.0.1+2   # Bug fix
version: 1.1.0+3   # New feature
version: 2.0.0+4   # Breaking changes
```

- **MAJOR**: Incompatible API changes
- **MINOR**: New functionality (backward compatible)
- **PATCH**: Bug fixes (backward compatible)
- **BUILD**: Build number (must increase with each upload)

## 🔍 Verifying APK Integrity

Each release includes SHA256 checksums:

```bash
# On Linux/Mac
sha256sum MoraGPA-v1.0.0.apk

# Compare with the .sha256 file
cat MoraGPA-v1.0.0.apk.sha256
```

## 🐛 Troubleshooting

### Build Fails on GitHub Actions

**Check the logs:**
1. Actions tab → Failed workflow
2. Expand failed step
3. Read error message

**Common issues:**
- Dependency conflicts → Check pubspec.yaml
- Android SDK version → Update in build.gradle
- Null safety errors → Migrate code to null-safe

### APK Won't Install

**Possible causes:**
- Minimum Android version not met
- Previous version installed with different signature
- Corrupted download

**Solutions:**
- Uninstall old version first
- Re-download APK
- Check device Android version

### Unsigned Release APK

If your release is unsigned:
- ❌ Keystore secrets not configured
- ❌ Secret names don't match exactly
- ❌ Base64 encoding incorrect

**Fix:** Double-check all 4 secrets are set correctly

## 📊 CI/CD Workflow Details

### Build APK Workflow
- **Triggers**: Push to main branches, PRs
- **Runs on**: Ubuntu latest
- **Flutter**: 3.35.6 stable
- **Java**: 17 (Temurin)
- **Artifacts**: Retained 30 days (debug) / 90 days (release)

### Release Workflow
- **Triggers**: Version tags, manual
- **Builds**: APK + AAB
- **Signs**: If secrets configured
- **Publishes**: GitHub Releases
- **Includes**: Checksums, metadata

## 🛡️ Security Best Practices

- ✅ Never commit keystore files
- ✅ Use strong keystore passwords
- ✅ Keep backup of keystore in secure location
- ✅ Rotate keys if compromised
- ✅ Use GitHub Secrets for credentials
- ✅ Enable 2FA on GitHub account
- ✅ Review workflow logs for sensitive data leaks

## 📚 Additional Resources

- [GitHub Actions Workflows](.github/workflows/README.md)
- [Flutter Deployment Guide](https://docs.flutter.dev/deployment/android)
- [Play Store Submission](https://support.google.com/googleplay/android-developer/answer/9859152)
- [Android App Signing](https://developer.android.com/studio/publish/app-signing)

## 🤖 Automated Updates

The CI/CD pipeline automatically:
- Runs on every push
- Tests code changes
- Builds artifacts
- Creates releases
- Validates builds
- Archives APKs

No manual intervention needed for most operations!

---

**Need Help?** Check the [Workflows README](.github/workflows/README.md) or open an issue.
