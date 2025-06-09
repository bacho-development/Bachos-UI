var config = {
  serverId: "1381623495624097906",
  inviteCode: "8MyVMCTV",
  theme: "dark",
  icon: "https://cdn.discordapp.com/icons/1381623495624097906/fad314302d8d9d45e10990a120cec3f4.png?size=256"
};

function getIcon() {
  var iconUrl = '';
  fetch(`https://cors-anywhere.herokuapp.com/https://discord.com/api/invites/${config.inviteCode}?with_counts=true`) // using cors anywhere because it crashes without a proxy, will switch to another later
    .then(response => {
        if (response.ok) {return response.json()};
      })
    .then(data => {
      if (data){
        const guild = data.guild;
        if (!guild.icon) throw new Error('No icon');
        iconUrl = `https://cdn.discordapp.com/icons/${config.serverId}/${guild.icon}.png?size=256`;
      }
     })
    .catch(error => {
      console.error(error.stack)
  });
  return iconUrl
}

fetch(`https://discord.com/api/v10/invites/${config.inviteCode}?with_counts=true`)
  .then(response => response.json())
  .then(data => {
    const widget = document.querySelector('.discord-invite-widget');
    
    widget.innerHTML = `
      <div class="discord-invite ${config.theme}">
        <div class="server-info">
          <img 
            src='${getIcon() || config.icon}'
            alt="Server Icon" 
            class="server-icon"
          >
          <div class="server-meta">
            <span class="server-name">${data.profile.name}</span>
            <span class="member-count"><svg xmlns="http://www.w3.org/2000/svg" width="8" height="8" viewBox="0 0 64 64" enable-background="new 0 0 64 64"><path d="m32 2c-16.568 0-30 13.432-30 30s13.432 30 30 30 30-13.432 30-30-13.432-30-30-30" fill="#757575"/></svg> ${data.profile.member_count} members  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="8" height="8" viewBox="0 0 36 36" aria-hidden="true" role="img" class="iconify iconify--twemoji" preserveAspectRatio="xMidYMid meet"><circle fill="#78B159" cx="18" cy="18" r="18"/></svg>  ${data.profile.online_count} members active</span>
          </div>
        </div>
        <a 
          href="${`https://discord.gg/${config.inviteCode}`}" 
          target="_blank" 
          class="join-button"
        >
          Join
        </a>
      </div>
    `;
  })
  .catch(error => {
    console.error("Widget loading error:", error);
    document.querySelector('.discord-invite-widget').innerHTML = `
      <div class="discord-invite error">
        Could not load the discord widget
        <a href="https://discord.gg/${config.inviteCode}" target="_blank" class="join-button">
          Try to join
        </a>
      </div>
    `;
  });
