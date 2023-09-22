import discord
from discord.ext import commands
import datetime
import pandas as pd
from scraping import get_live_scores, team_1, team_2, match_status

TOKEN = 'MTE0OTUyNTc4NDYwODg5OTEwMw.GuKM1v.FQ_gdGWke3f_ZyDGwydHrSdGn-gxit4B1wOWc0'

intents = discord.Intents.default()
intents.typing = False

bot = commands.Bot(command_prefix='!', intents=intents,help_command=None)

data_df = pd.DataFrame(columns=['Team 1', 'Team 2', 'Match Status', 'Date'])

@bot.event
async def on_ready():
    print(f'Logged in as {bot.user.name}')

@bot.command(name='livescore')
async def get_cricket_score(ctx):
    global data_df
    score_data = get_live_scores()

    
    new_data = {
        'Team 1': team_1,
        'Team 2': team_2,
        'Match Status': match_status,
        'Date': datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    }
    data_df = pd.concat([data_df, pd.DataFrame([new_data])], ignore_index=True)


    data_df.to_csv('livescore_data.csv', mode='a', header=False, index=False)


    await ctx.send(f'{team_1}\n{team_2}\n{match_status}')
    await ctx.send(f"Current Date: {new_data['Date']}")

@bot.command(name='csv')
async def display_csv_data(ctx):
    try:
        data_df = pd.read_csv('livescore_data.csv')
        csv_data = data_df.to_string(index=False)
        await ctx.send(f'```\n{csv_data}\n```')
    except FileNotFoundError:
        await ctx.send("CSV file not found. Use the !livescore command to generate data first.")
@bot.command(name= 'help')
async def help(context):
    await context.send("Commands:")
    await context.send("!csv - get the csv file the livescores are stored in ")
    await context.send("!livescore - get the live scores")
    await context.send("!help - get the list of commands")
bot.run(TOKEN)
