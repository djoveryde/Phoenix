
public class BlockSkull extends BlockContainer {
      public void dropNaturally(World world, int i, int j, int k, int l, float f, int i1) {
          if (world.random.nextFloat() < f) {
              ItemStack itemstack = new ItemStack(Items.SKULL, 1, this.getDropData(world, i, j, k));
 
             // PaperSpigot start - Fix rare cannot cast issue with TESkull
             TileEntity tileEntity = world.getTileEntity(i, j, k);
             if (!(tileEntity instanceof TileEntitySkull)) {
                 return;
             }
             TileEntitySkull tileentityskull = (TileEntitySkull) tileEntity;
             // PaperSpigot end
  
              if (tileentityskull.getSkullType() == 3 && tileentityskull.getGameProfile() != null) {
                  itemstack.setTag(new NBTTagCompound()); 
