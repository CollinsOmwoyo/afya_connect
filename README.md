# **Afya Connect** 🏥💊  

_A comprehensive healthcare app built with Flutter._  
  

---

## **📌 Features**  

✅ **Locate Clinics & Pharmacies** – Search and filter healthcare facilities.  
✅ **Book & Manage Appointments** – Schedule, view, and cancel appointments.  
✅ **AI Chatbot Support** – Get automated health guidance.  
✅ **Medication Search** – Find available medicines in pharmacies.  
✅ **Offline CSV Data Handling** – Uses preloaded clinic & pharmacy data.  

---

## **📂 Project Structure**  

```bash
afya_connect/
│── lib/
│   ├── main.dart                 # Entry point
│   ├── models/                   # Data models (Clinics, Pharmacies, Appointments)
│   ├── providers/                # State management (Provider)
│   ├── services/                 # CSV Parsing & API Handling
│   ├── views/                     # UI Screens
│   │   ├── home/                  # Home Screen
│   │   ├── clinics_list.dart      # Clinics List
│   │   ├── pharmacies_list.dart   # Pharmacies List
│   │   ├── appointments_screen.dart # Appointment Booking
│   │   ├── chatbot_screen.dart    # AI Chatbot
│   ├── widgets/                   # Reusable UI Components
│
│── assets/
│   ├── data/
│   │   ├── clinics.csv            # Preloaded clinics data
│   │   ├── pharmacies.csv         # Preloaded pharmacies data
│
│── pubspec.yaml                   # Dependencies
│── README.md                       # Project Documentation
