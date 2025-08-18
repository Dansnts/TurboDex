# **TurboDex **

*“Gotta snap ’em all!” — Your AI-powered car Pokédex*

![TurboDex Banner](logo.png)

---

## Overview

**TurboDex** is a cross-platform mobile and web application that lets users:

* Snap cars in the wild 
* Instantly recognize their **make & model** using **AI fine-tuned on car datasets** 
* Automatically **blur faces and license plates** for privacy 
* Collect and track sightings in a personal **Pokédex-like collection** 
* Share and explore a community-driven **feed of car spots** 

TurboDex combines **cutting-edge machine learning**, **modern app design**, and **cloud-native infrastructure** to deliver a fun, safe, and scalable car-spotting experience.

---

## Visual identity
![Visual Identity](visualIdentity.png)

---

##  Features

 **AI Car Recognition** – Identify car make/model instantly
 **Privacy First** – Automatic blurring of faces & license plates
 **Gamified Collection** – Build your personal Pokédex of cars
 **Social Feed** – Share and discover cars spotted worldwide
 **Cross-Platform App** – Works on iOS, Android, and Web
 **Landing Page** – Clean marketing site with FAQs, About, and download links

---

## Tech Stack

### **Frontend (App & Landing Page)**

* [.NET MAUI](https://learn.microsoft.com/en-us/dotnet/maui/) (cross-platform mobile & desktop)
* [Next.js 14](https://nextjs.org/) (landing page)
* [TypeScript](https://www.typescriptlang.org/)
* [TailwindCSS](https://tailwindcss.com/) + [shadcn/ui](https://ui.shadcn.com/)

### **Backend & Infrastructure**

* [FastAPI](https://fastapi.tiangolo.com/) (REST API)
* [PostgreSQL](https://www.postgresql.org/) (relational DB)
* [Redis](https://redis.io/) (caching & async tasks)
* [Celery](https://docs.celeryq.dev/) (background processing)
* [Docker](https://www.docker.com/) + [GitHub Actions](https://github.com/features/actions)
* [Azure Container Apps](https://azure.microsoft.com/) (deployment)

### **Machine Learning**

* [YOLOv8](https://github.com/ultralytics/ultralytics) for **face & plate detection/blurring**
* [EfficientNet / ResNet / ViT](https://paperswithcode.com/method/efficientnet) fine-tuned for **car recognition**
* [Azure Custom Vision](https://azure.microsoft.com/en-us/services/cognitive-services/custom-vision/) (Plan A, managed training)
* [ONNX / PyTorch](https://pytorch.org/) (Plan B, self-hosted models)

---

## Architecture

```ascii
                  ┌─────────────────────────┐
                  │        Landing Page      │
                  │ (Next.js + TailwindCSS)  │
                  └──────────────┬──────────┘
                                 │
                  ┌──────────────▼───────────────┐
                  │        API Gateway (FastAPI)  │
                  └───────┬──────────┬───────────┘
                          │          │
        ┌─────────────────▼──┐   ┌───▼────────────────┐
        │ Car Recognition AI │   │ Face/Plate Blurring │
        │ (PyTorch/ONNX)     │   │ (YOLOv8)           │
        └──────────┬─────────┘   └──────────┬────────┘
                   │                        │
         ┌─────────▼──────────┐   ┌─────────▼─────────┐
         │ PostgreSQL (cars,  │   │ Redis + Celery     │
         │ users, collections)│   │ (async processing) │
         └─────────┬──────────┘   └─────────┬─────────┘
                   │                        │
           ┌───────▼────────┐       ┌───────▼─────────┐
           │   .NET MAUI     │       │  Feed/Community │
           │   Mobile App    │       │    Features     │
           └─────────────────┘       └─────────────────┘
```

---

## Getting Started

### **1. Clone the repository**

```bash
git clone https://github.com/your-org/turbodex.git
cd turbodex
```

### **2. Backend Setup (FastAPI + DB)**

```bash
cd backend
docker-compose up --build
```

Services:

* API → `http://localhost:8000`
* PostgreSQL → `localhost:5432`
* Redis → `localhost:6379`

### **3. Frontend (Landing Page)**

```bash
cd landing
npm install
npm run dev
```

Access at → `http://localhost:3000`

### **4. Mobile App (.NET MAUI)**

```bash
cd app
dotnet build
dotnet run
```

---

## Agile Roadmap

### **Week 1: Foundations**

* Set up GitHub repo + CI/CD pipeline
* Define DB schema (users, cars, collections, feed)
* Landing page basic version online

### **Week 2: Core Features**

* AI pipeline (blur + car recognition API)
* Mobile app prototype (camera, capture, collection)
* Feed & user profiles (basic CRUD)

### **Week 3: Refinement & Demo**

* Fine-tune AI models with collected dataset
* Polish UI (animations, onboarding, profile settings)
* Deploy full stack on Azure + live demo

---

## Dataset & AI Training

* **Source**: Open car datasets (Stanford Cars, CompCars, etc.) + user-contributed data
* **Preprocessing**: resize, normalize, augment (rotations, lighting, occlusions)
* **Models**:

  * **YOLOv8** → faces & plates → blur
  * **EfficientNet/ResNet** → car recognition
* **Training**:

  * Initial training on public dataset
  * Fine-tuning with TurboDex-specific images

---

## Contributing

1. Fork the repo
2. Create your feature branch (`git checkout -b feature/my-feature`)
3. Commit changes (`git commit -m "feat: add my feature"`)
4. Push (`git push origin feature/my-feature`)
5. Open a Pull Request

---

## License

[MIT](LICENSE) © 2025 TurboDex Team
