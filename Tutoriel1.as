package MinkoTutoriels
{
	import aerys.minko.render.geometry.primitive.CubeGeometry;
	import aerys.minko.render.material.basic.BasicMaterial;
	import aerys.minko.scene.node.camera.Camera;
	import aerys.minko.scene.node.Mesh;
	import flash.display.Sprite;
	import flash.events.Event;
	import aerys.minko.render.Viewport;
	import aerys.minko.scene.node.Scene;
	
	/**
	 * Premiers pas avec Minko.
	 * Tutoriel 1 : Création et affichage d'un cube.
	 * Éléments survolés : Scene, Viewport, Camera, Mesh, Material, CubeGeometry
	 * @author Ludovic Bas
	 */
	public class Tutoriel1 extends Sprite 
	{
		private var _viewport : Viewport;
		private var _scene : Scene;
		
		public function Tutoriel1():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_viewport = new Viewport();
			addChild(_viewport);
			_scene = new Scene();
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			createCamera();
			createCube();
		}
		protected function enterFrameHandler(event : Event) : void
		{
			//A chaque frame la scène (=scene graph) est rendue dans le viewport (=Sprite flash)
			_scene.render(_viewport);
		}
		protected function createCamera():void {
			var camera : Camera = new Camera();
			//la caméra est un élément de la scène, c'est pourquoi on l'ajoute dans la scène
			_scene.addChild(camera);
		}
		protected function createCube():void {
			//le mesh est un élément de la scène qui nécessite une géométrie et un matériau.
			var cube:Mesh = new Mesh(CubeGeometry.cubeGeometry, new BasicMaterial( { diffuseColor:0x00ff00ff } ));
			cube.transform.translationZ = 5.;
			_scene.addChild(cube);
		}
		
	}
	
}