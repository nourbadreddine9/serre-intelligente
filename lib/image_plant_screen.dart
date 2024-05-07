
import 'package:app/screens/analyse_image_screen.dart';
import 'package:flutter/material.dart';
class ImagePlantScreen extends StatelessWidget {
  const ImagePlantScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    // Liste de noms de plantes et leurs images (remplacez les noms d'images par les vôtres)
    List<String> plantNames = ['Mosaic Virus', 'Target Spot', 'Bacterial spot', 'Yellow Leaf Curl Virus', 'Late blight', 'Leaf_Mold', 'Early blight', 'Two-spotted spider mite', 'Septoria Leaf Spot', 'Healthy'];
    List<String> plantImages = [
      'assets/images/mosaic_virus.png',
      'assets/images/target_spot.jpg',
      'assets/images/bacterial_spot.jpg',
      'assets/images/yellow_leaf_curl.png',
      'assets/images/late_blight.jpg',
      'assets/images/leaf_mold.jpg',
      'assets/images/early_blight.jpeg',
      'assets/images/spider_mite.jpg',
      'assets/images/septoria_leaf_spot.jpg',
      'assets/images/healthy.jpg',
      
      
    ];
    return Scaffold(
      body: Container(
        color: Color(0xFFE3FFD1), // Arrière-plan vert
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Nombre de colonnes dans la grille
              mainAxisSpacing: 16.0, // Espacement vertical entre les éléments
              crossAxisSpacing: 16.0, // Espacement horizontal entre les éléments
              childAspectRatio: 0.7, // Ratio hauteur/largeur des cellules
            ),
            itemCount: plantNames.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // Ajoutez ici le code à exécuter lorsque l'utilisateur appuie sur une plante
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnalyseImageScreen(), // Redirige vers l'interface Forgetpassword1
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFCCCCCC),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                          child: Image.asset(
                            plantImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                plantNames[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}