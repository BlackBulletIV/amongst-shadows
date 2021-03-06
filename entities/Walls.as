package entities
{
  import net.flashpunk.*;
  import net.flashpunk.graphics.Tilemap;
  
  public class Walls extends AreaEntity
  {
    public var map:Tilemap;
    
    public function Walls(width:uint, height:uint)
    {
      layer = 7;
      setHitbox(width, height);
      graphic = map = new Tilemap(Game.TILES, width, height, Game.TILE_SIZE, Game.TILE_SIZE);
      map.usePositions = true;
      map.color = 0xAAAAAA;
    }
    
    public function loadFromXML(data:XML):void
    {
      for each (var o:Object in data.walls.tile) map.setTile(o.@x, o.@y, o.@id);
      for each (o in data.walls.rect) map.setRect(o.@x, o.@y, o.@w, o.@h, o.@id);
    }
  }
}
