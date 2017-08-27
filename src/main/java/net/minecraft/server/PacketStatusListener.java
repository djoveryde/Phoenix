@@ -33,7 +33,21 @@ public class PacketStatusListener implements PacketStatusInListener {
  
      public void a() {}
  
     // PaperSpigot start - Readability for ping MOTD fix backport
     private static final int WAITING = 0;
     private static final int PING = 1;
     private static final int DONE = 2;
     private int state = WAITING;
     // PaperSpigot end
 
      public void a(PacketStatusInStart packetstatusinstart) {
         // PaperSpigot start - Backport ping MOTD fix
         if (this.state != WAITING) {
             this.networkManager.close(null);
             return;
         }
         this.state = PING;
         // PaperSpigot end
          // CraftBukkit start - fire ping event
          final Object[] players = minecraftServer.getPlayerList().players.toArray();
          class ServerListPingEvent extends org.bukkit.event.server.ServerListPingEvent {
 @@ -130,6 +144,13 @@ public class PacketStatusListener implements PacketStatusInListener {
      }
  
      public void a(PacketStatusInPing packetstatusinping) {
         // PaperSpigot start - Backport ping MOTD fix
         if (this.state != PING) {
             this.networkManager.close(null);
             return;
         }
         this.state = DONE;
         // PaperSpigot end
          this.networkManager.handle(new PacketStatusOutPong(packetstatusinping.c()), new GenericFutureListener[0]);
      }
  }

        
