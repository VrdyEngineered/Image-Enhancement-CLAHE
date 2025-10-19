# 🩺 Medical Image Enhancement using CLAHE Algorithm

### 📘 Project Overview
This project focuses on **enhancing medical images** (like retinal fundus and brain MRI scans) using the **CLAHE (Contrast Limited Adaptive Histogram Equalization)** algorithm.  
Medical images often suffer from **noise** and **low contrast** due to limitations in imaging equipment or lighting conditions. The proposed method enhances **local contrast** and highlights fine anatomical structures without amplifying noise.

---

## 👥 Authors
- **Chivirala Vignesh (BT23ECI031)**  
- **Gundrathi Aprameya Goud (BT23ECI035)**  
- **Chilla Vivek Reddy (BT23ECI037)**  
> *Department of Electronics and Communication Engineering (IoT)*  
> *Indian Institute of Information Technology, Nagpur*

---

## 🧠 Abstract
The project applies the CLAHE technique to adaptively adjust contrast in medical images, resulting in clearer visualization of anatomical and vascular structures.  
Key metrics such as **SNR (Signal-to-Noise Ratio)** and **Entropy** are used to evaluate image quality improvements.  
The adaptive approach ensures robust, artifact-free enhancement suitable for real-world medical imaging applications.

---

## ⚙️ Methodology

### Step-by-Step Process
1. **Input Image Decomposition**  
   - The RGB channels are separated, and CLAHE is applied to the **Green (G) channel**, which contains the most vascular information.

2. **Tile-Based Processing**  
   - The image is divided into small contextual tiles (e.g., 8×8 or 16×16 pixels).  
   - Each tile undergoes local histogram equalization.

3. **Histogram Clipping**  
   - To prevent over-enhancement, histograms are clipped at a predefined **clip limit**.

4. **Bilinear Interpolation**  
   - Smooths transitions between tiles to remove block artifacts.

5. **Channel Merging**  
   - The enhanced G’ channel is merged back with the original R and B channels to obtain the final enhanced image.

---

## 🧩 Algorithm Summary

CLAHE improves upon global histogram equalization by:
- Enhancing **local contrast** in smaller regions of the image.
- Controlling **noise amplification** using the clip limit parameter (α).
- Preserving fine structural details like retinal vessels and tissue boundaries.

**Mathematical Basis:**
\[
g = [g_{max} - g_{min}] \cdot P(f) + g_{min}
\]
where \(P(f)\) is the cumulative probability distribution of pixel intensity \(f\).

---

## 🧪 Experiments & Results

### 1. Retinal Fundus Images
- Original images had poor illumination and weak vessel visibility.  
- After applying CLAHE:
  - Vessels and lesions became clearer.
  - Local contrast improved.
  - Histograms showed redistributed intensities.

### 2. Brain MRI Images
- Enhanced distinction between **white** and **gray matter**.
- Improved tissue boundaries and reduced noise.

**Figures (from the Poster):**
- *Figure 3 & 4:* Retinal image and histogram before/after CLAHE  
- *Figure 5 & 6:* Brain MRI image and histogram before/after CLAHE

---

## 🩻 Applications
- **Retinal Disease Detection** – Enhances visibility of vessels, lesions, and optic disc.  
- **Brain MRI Analysis** – Improves contrast between gray and white matter.  
- **Preprocessing for Deep Learning** – Provides better input for CNN-based models.  
- **Tele-Ophthalmology** – Suitable for portable and low-light imaging systems.  
- **Other Modalities** – CT, X-ray, and ultrasound image enhancement.

---

## 🧾 Conclusion
CLAHE effectively enhances local contrast and suppresses noise, making it a powerful tool in medical image processing.  
It improves visibility of fine structures, supports accurate diagnosis, and serves as a valuable preprocessing step for automated image analysis.

---

## 🙏 Acknowledgments
Special thanks to **Dr. Tapan K. Jain** for his guidance and support.  
We also acknowledge the contributions of peers, open-source datasets, and tools that made this work possible.

---

