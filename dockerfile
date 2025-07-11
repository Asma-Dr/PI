# Étape 1 : choisir une image de base Python officielle
FROM python:3.11-slim

# Étape 2 : définir le dossier de travail dans le container
WORKDIR /app

# Étape 3 : copier les fichiers requirements.txt et installer les dépendances
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Étape 4 : copier tout le contenu du projet dans le dossier de travail
COPY . .

# Étape 5 : exposer le port que Streamlit utilise (par défaut 8501)
EXPOSE 8501

# Étape 6 : définir la commande de démarrage du container : lancer Streamlit
CMD ["streamlit", "run", "main.py", "--server.port=8501", "--server.address=0.0.0.0"]
