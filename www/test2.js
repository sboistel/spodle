const express = require('express');
const bodyParser = require('body-parser');
const { exec } = require('child_process');

const app = express();

app.use(bodyParser.json());

app.post('/download', (req, res) => {
    const url = req.body.url;

    // Exécute le script Bash avec l'URL en tant qu'argument
    exec(`./download_script.sh ${url}`, (error, stdout, stderr) => {
        if (error) {
            console.error('Erreur lors de l\'exécution du script :', error);
            return res.status(500).send('Erreur lors du téléchargement du fichier');
        }
        console.log('Script terminé avec succès :', stdout);
        res.send('Le fichier a été téléchargé avec succès');
    });
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Serveur démarré sur le port ${PORT}`);
});
