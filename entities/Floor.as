package entities
{
  import net.flashpunk.*;
  import net.flashpunk.graphics.Tilemap;
  import net.flashpunk.masks.Grid;
  
  public class Floor extends AreaEntity
  {
    public var map:Tilemap;
    public var grid:Grid;
    
    public function Floor(width:uint, height:uint)
    {
      type = "solid";
      layer = 5;
      setHitbox(width, height);
      graphic = map = new Tilemap(Game.TILES, width, height, Game.TILE_SIZE, Game.TILE_SIZE);
      mask = grid = new Grid(width, height, Game.TILE_SIZE, Game.TILE_SIZE);
      map.usePositions = grid.usePositions = true;
    }
    
    public function loadFromXML(data:XML):void
    {
      for each (var o:Object in data.floor.tile)
      {
        map.setTile(o.@x, o.@y, o.@id);
        grid.setTile(o.@x, o.@y);
      }
      
      for each (o in data.floor.rect)
      {
        map.setRect(o.@x, o.@y, o.@w, o.@h, o.@id);
        grid.setRect(o.@x, o.@y, o.@w, o.@h);
      }
    }
  }
}
